let Vue = require('vue')

const NotFound = { template: '<p>Page not found</p>'}
const Vue_Demo = { template: '<p>Hello World!</p>'}
const Games = { template: '<p>Hello Games page!</p>'}
const Home = { template: '<p>home page'}
const About = { template: '<p>about page</p>'}

const routes = {
  '/': Home,
  '/about': About,
  '/games': Games,
  '/vue_demo': Vue_Demo
}

let app = new Vue({
  el: '#app',
  data: {
    currentRoute: window.location.pathname,
    message: "Special Message for the Vue Demo"
  },
  computed: {
    ViewComponent() {
      return routes[this.currentRoute] || NotFound
    }
  },
  render (h) {return h(this.ViewComponent) }
})