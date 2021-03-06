import AppKit

final class Window: NSWindow {
    init() {
        super.init(contentRect: .init(x: 0, y: 0, width: 1500, height: 1000), styleMask: [.borderless, .miniaturizable, .resizable, .closable, .titled, .unifiedTitleAndToolbar, .fullSizeContentView], backing: .buffered, defer: false)
        minSize = .init(width: 900, height: 600)
        center()
        appearance = NSAppearance(named: .darkAqua)
        backgroundColor = .black
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
        toolbar = .init()
        toolbar!.showsBaselineSeparator = false
        isOpaque = true
        collectionBehavior = .fullScreenNone
        isReleasedWhenClosed = false
        isMovableByWindowBackground = false
        contentView = View()
    }
    
    override func close() {
        NSApp.terminate(nil)
    }
}
