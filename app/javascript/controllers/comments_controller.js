import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  initialize() {}
  connect() {}
  toggleForm(event) {
    console.log('I clockedo n the edit button');
    event.preventDefault();
    event.stopPropagation();
  }
}
