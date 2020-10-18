workspace "ZorlockRPG"
	architecture "x86_64"
	startproject "ZorlockRPG"
	
		configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}
	
	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
	
	IncludeDir = {}
	IncludeDir["ImGui"] = "Vendor/imgui"
	IncludeDir["ImGuiNodeEditor"] = "Vendor/imgui-node-editor"
	IncludeDir["SFML"] = "Vendor/SFML"
	

	
	project "Engine"
	location "Engine"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	--pchheader "ZLpch.h"
	--pchsource "Engine/src/ZLpch.cpp"
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{IncludeDir.ImGui}/**.cpp",
		"%{IncludeDir.ImGuiNodeEditor}/**.cpp",
	}
	
		includedirs
	{
		"%{prj.name}/src",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.ImGuiNodeEditor}",
		"%{IncludeDir.SFML}/include",
		
	}
	
	libdirs
	{
		"%{IncludeDir.SFML}/lib"
	}
	
		links 
	{ 
		"sfml-graphics.lib",
		"sfml-window.lib",
		"sfml-system.lib",
		"opengl32.lib"
	}
	
		filter "system:windows"
		systemversion "latest"

		defines
		{
		}

	filter "configurations:Debug"
		defines "ZL_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "ZL_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "ZL_DIST"
		runtime "Release"
		optimize "on"
		
project "RPGGame"
	location "RPGGame"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++14"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	links
	{
		"Engine"
	}

		includedirs
	{
		"%{prj.name}/src",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.ImGuiNodeEditor}",
		"%{IncludeDir.SFML}/include",
		
	}

	filter "system:windows"
		systemversion "latest"
		
	filter "configurations:Debug"
		defines "ZL_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "ZL_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "ZL_DIST"
		runtime "Release"
		optimize "on"
		
		
		
	project "RPGEditor"
	location "RPGEditor"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++14"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	links
	{
		"Engine"
	}

		includedirs
	{
		"%{prj.name}/src",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.ImGuiNodeEditor}",
		"%{IncludeDir.SFML}/include",
		
	}

	filter "system:windows"
		systemversion "latest"
		
	filter "configurations:Debug"
		defines "ZL_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "ZL_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "ZL_DIST"
		runtime "Release"
		optimize "on"
		
		