Pod::Spec.new do |s|

  s.name         = "WLScheduleTableCell"
  s.version      = "0.0.6"
  swift_versions = '5.0'
  s.summary      = "Event of Time Axi for UITableView."
  s.description  = "This component for custom UITableViewCell." 
  s.homepage     = "https://github.com/luowanglin/WLScheduleTableCell"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "luowanglin" => "luowanglin@icloud.com" }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/luowanglin/WLScheduleTableCell.git", :tag => "#{s.version}" }
  s.source_files  = "WLScheduleTableCell/Classes/*.swift"
  s.resources = "WLScheduleTableCell/Classes/source/*.png"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }

end
