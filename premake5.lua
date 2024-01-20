project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	architecture "x64"
	targetdir ("%{wks.location}/bin/" .. outputdir)
	objdir ("%{wks.location}/bin-int/" .. tmpdir)

	files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		optimize "full"

	filter { "action:gmake2" }
		architecture "x86"
		makesettings [[
CC = emcc
CXX = em++
AR = emar
		]]
		targetextension  ".a"
		buildoptions { "-Wall -Wformat -s DISABLE_EXCEPTION_CATCHING=1" }
		linkoptions { "-s DISABLE_EXCEPTION_CATCHING=1 -s USE_SDL=2 -s USE_GLFW=3 -s FULL_ES3=1 -s FORCE_FILESYSTEM=1 -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s NO_EXIT_RUNTIME=0 -s ASSERTIONS=1 --no-heap-copy" }
