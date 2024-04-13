
Pod::Spec.new do |spec|

  spec.name         = "FSNetworkManager"
  spec.version      = "1.1.0"
  spec.homepage     = "https://github.com/faisal330/FSNetworkManager"
  spec.license      = "MIT"
  spec.author       = { "Faisal Shahzad" => "faisalshahzad330@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/faisal330/FSNetworkManager.git", :tag => spec.version.to_s }
  spec.source_files  = "FSNetworkManager/**/*.{swift}"
  spec.swift_version = "5.0"

  spec.summary      = "FSNetworkManager: iOS framework simplifying REST API communication, allowing devs to focus on crafting exceptional user experiences."
  spec.description  = "FSNetworkManager is an iOS framework engineered to streamline REST API communication, providing developers with a seamless interface to effortlessly manage networking tasks. By abstracting away complexities, it enables a focus on crafting superior user experiences while ensuring robust and reliable data exchange."
  
end
