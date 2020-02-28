require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

//= require jquery
//= require jquery_ujs

// *** libraries ***
import "bootstrap";


// *** components ***

AOS.init({
  duration: 800,
  easing: 'slide',
  once: true
 });


import { siteMenuClone, scrollWindow, OnePageNavigation } from '../components/navbar';
siteMenuClone();
scrollWindow();
OnePageNavigation();

