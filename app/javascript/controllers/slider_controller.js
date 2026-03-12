import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  export default class extends Controller {
  static targets = ["slides", "slide", "currentSlide", "playIcon", "pauseIcon"]

  connect() {
    this.currentIndex = 0
    this.totalSlides = this.slideTargets.length
    this.autoplayInterval = null
    this.autoplaySpeed = 5000 // 5 seconds
    
    this.updateSlidePosition()
    this.updateIndicators()
    this.startAutoplay()
  }

  disconnect() {
    this.stopAutoplay()
  }

  next() {
    this.goToSlide(this.currentIndex + 1)
  }

  previous() {
    this.goToSlide(this.currentIndex - 1)
  }

  goToSlide(event) {
    const index = event.params?.index ?? event.currentTarget.dataset.index
    this.currentIndex = parseInt(index)
    this.updateSlidePosition()
    this.updateIndicators()
    this.resetAutoplay()
  }

  updateSlidePosition() {
    const offset = -this.currentIndex * 100
    this.slidesTarget.style.transform = `translateX(${offset}%)`
    
    // Update counter
    if (this.hasCurrentSlideTarget) {
      this.currentSlideTarget.textContent = this.currentIndex + 1
    }
  }

  updateIndicators() {
    // Update dot indicators
    const dots = this.element.querySelectorAll('[data-action="click->slider#goToSlide"]')
    dots.forEach((dot, index) => {
      if (index === this.currentIndex) {
        dot.classList.remove('bg-white/50', 'hover:bg-white')
        dot.classList.add('bg-[#FFB347]', 'w-4', 'md:w-5')
        dot.setAttribute('aria-current', 'true')
      } else {
        dot.classList.add('bg-white/50', 'hover:bg-white')
        dot.classList.remove('bg-[#FFB347]', 'w-4', 'md:w-5')
        dot.classList.add('w-2', 'md:w-2.5')
        dot.removeAttribute('aria-current')
      }
    })
  }

  toggleAutoplay() {
    if (this.autoplayInterval) {
      this.stopAutoplay()
      this.playIconTarget.classList.remove('hidden')
      this.pauseIconTarget.classList.add('hidden')
    } else {
      this.startAutoplay()
      this.playIconTarget.classList.add('hidden')
      this.pauseIconTarget.classList.remove('hidden')
    }
  }

  startAutoplay() {
    if (!this.autoplayInterval) {
      this.autoplayInterval = setInterval(() => {
        this.next()
      }, this.autoplaySpeed)
    }
  }

  stopAutoplay() {
    if (this.autoplayInterval) {
      clearInterval(this.autoplayInterval)
      this.autoplayInterval = null
    }
  }

  resetAutoplay() {
    if (this.autoplayInterval) {
      this.stopAutoplay()
      this.startAutoplay()
    }
  }
}

