cask "arq" do
  version "7.13"
  sha256 "3ddc0cbcf86cf2a5854f0fd18513e36f449a1f59a2feb654859c5a6cf56da842"

  url "https://www.arqbackup.com/download/arqbackup/Arq#{version}.pkg"
  name "Arq"
  desc "Multi-cloud backup application"
  homepage "https://www.arqbackup.com/"

  livecheck do
    url "https://www.arqbackup.com/download/arqbackup/arq#{version.major}_release_notes.html"
    regex(/Version\s*(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :yosemite"

  pkg "Arq#{version}.pkg"

  uninstall pkgutil:   "com.haystacksoftware.Arq",
            quit:      "com.haystacksoftware.Arq",
            delete:    [
              "/Applications/Arq.app",
              "/Library/Application Support/ArqAgent",
              "/Library/Application Support/ArqAgentAPFS",
            ],
            launchctl: [
              "com.haystacksoftware.ArqMonitor",
              "com.haystacksoftware.arqagent",
            ]

  zap trash: "~/Library/Application Support/Arq *"
end
