cask "reader" do
  version "0.1.63"
  sha256 "cbd649fc5ad2a34e39b046c7c9aa61ac1e7b2138f9188ccf5f0d0faa56d87424"

  url "https://github.com/readwiseio/reader-desktop-releases/releases/download/reader-desktop-v#{version}/Reader_#{version}_universal.dmg",
      verified: "github.com/readwiseio/reader-desktop-releases/"
  name "Readwise Reader"
  desc "Save articles to read, highlight key content, and organize notes for review"
  homepage "https://readwise.io/read/"

  livecheck do
    url "https://reader-desktop-releases.readwise.io/update-manifest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Reader.app"

  zap trash: [
    "~/Library/Application Support/io.readwise.read",
    "~/Library/Caches/io.readwise.read",
    "~/Library/HTTPStorages/io.readwise.read.binarycookies",
    "~/Library/Saved Application State/io.readwise.read.savedState",
    "~/Library/WebKit/io.readwise.read",
  ]
end
