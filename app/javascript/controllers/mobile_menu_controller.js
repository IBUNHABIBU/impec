import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon", "overlay"]

  connect() {
    this.isOpen = false
    this.updateIcons()
    this.setupEventListeners()
  }

  disconnect() {
    this.removeEventListeners()
  }

  toggle() {
    this.isOpen = !this.isOpen
    this.updateMenu()
    this.updateIcons()
    this.updateOverlay()
  }

  close() {
    this.isOpen = false
    this.updateMenu()
    this.updateIcons()
    this.updateOverlay()
  }

  updateMenu() {
    if (this.isOpen) {
      this.menuTarget.classList.remove('hidden')
      document.body.classList.add('overflow-hidden')
    } else {
      this.menuTarget.classList.add('hidden')
      document.body.classList.remove('overflow-hidden')
    }
  }

  updateIcons() {
    if (this.isOpen) {
      this.openIconTarget.classList.add('hidden')
      this.closeIconTarget.classList.remove('hidden')
    } else {
      this.openIconTarget.classList.remove('hidden')
      this.closeIconTarget.classList.add('hidden')
    }
  }

  updateOverlay() {
    if (this.isOpen) {
      this.overlayTarget.classList.remove('hidden')
    } else {
      this.overlayTarget.classList.add('hidden')
    }
  }

  setupEventListeners() {
    this.boundHandleEscape = this.handleEscape.bind(this)
    document.addEventListener('keydown', this.boundHandleEscape)
  }

  removeEventListeners() {
    document.removeEventListener('keydown', this.boundHandleEscape)
  }

  handleEscape(event) {
    if (event.key === 'Escape' && this.isOpen) {
      this.close()
    }
  }
}