Pod::Spec.new do |s|
  s.name         = "HWToast"
  s.version      = "0.9"
  s.summary      = "HWToast can display a toast with custom views in a flexible way."
  s.description  = "You can make a toast easily in a block."
  s.homepage     = "https://github.com/ChatGame/HWToast"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license = { :type => "MIT", :file => "LICENSE" }
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author = { "callmewhy" => "https://github.com/callmewhy" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform = :ios, "7.0"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = { :git => "https://github.com/ChatGame/HWToast.git", :tag => "0.9" }
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "Classes/{HWToastView, Category, Tool, View, **}/*.{h,m}"
  s.resource = "Classes/HWToastImage.bundle"
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
end