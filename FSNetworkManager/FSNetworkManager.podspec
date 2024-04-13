
Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "FSNetworkManager"
  spec.version      = "1.0.1"
  spec.summary      = "FSNetworkManager: iOS framework simplifying REST API communication, allowing devs to focus on crafting exceptional user experiences."
  spec.description  = "FSNetworkManager is an iOS framework engineered to streamline REST API communication, providing developers with a seamless interface to effortlessly manage networking tasks. By abstracting away complexities, it enables a focus on crafting superior user experiences while ensuring robust and reliable data exchange."
  spec.homepage     = "https://github.com/faisal330/FSNetworkManager"
  
  spec.license      = "MIT"
  spec.author             = { "Faisal Shahzad" => "faisalshahzad330@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/faisal330/FSNetworkManager.git", :tag => spec.version.to_s }

  spec.source_files  = "FSNetworkManager/**/*.{swift}"
  spec.swift_version = "5.0"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
