import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["slides", "dot"]
  static values = { index: Number }

  connect() {
    this.indexValue = this.indexValue || 0
    this.total = this.slidesTarget.children.length
    this.showSlide(this.indexValue)
    this.startAutoSlide()
  }

  disconnect() {
    this.stopAutoSlide()
  }

  // Show slide by index
  showSlide(index) {
    this.indexValue = index
    const offset = -index * 100
    this.slidesTarget.style.transform = `translateX(${offset}%)`

    // update dots
    this.dotTargets.forEach((dot, i) => {
      dot.classList.toggle("bg-opacity-100", i === index)
      dot.classList.toggle("bg-opacity-50", i !== index)
    })
  }

  // Navigation
  next() {
    this.showSlide((this.indexValue + 1) % this.total)
    this.resetAutoSlide()
  }

  prev() {
    this.showSlide((this.indexValue - 1 + this.total) % this.total)
    this.resetAutoSlide()
  }

  goToSlide(e) {
    const index = parseInt(e.currentTarget.dataset.index, 10)
    this.showSlide(index)
    this.resetAutoSlide()
  }

  // Auto Slide
  startAutoSlide() {
    this.timer = setInterval(() => this.next(), 5000) // 5s
  }

  stopAutoSlide() {
    clearInterval(this.timer)
  }

  resetAutoSlide() {
    this.stopAutoSlide()
    this.startAutoSlide()
  }
}
