local _files =
{
	"src/**.h",
	"src/**.cpp",
	"include/**.h"
}

local _includedirs =
{
	"include"
}

group "Dependencies"
	project "yaml-cpp"
		kind "StaticLib"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
		targetdir ("%{wks.location}/bin/" .. outputdir)
		objdir ("%{wks.location}/bin-int/" .. tmpdir)

		files(_files)
		includedirs(_includedirs)

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

group "Browser/Dependencies"
	project "yaml-cpp.Web"
		kind "StaticLib"
		targetname "yaml-cpp"
		targetextension ".a"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
		targetdir ("%{wks.location}/bin/" .. outputdirweb)
		objdir ("%{wks.location}/bin-int/" .. tmpdirweb)

		files(_files)
		includedirs(_includedirs)

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

group ""