// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./tests/test_creation"
import "./tests/question_creation"
import "./groups/new_group"
import "./groups/find-student"
import "./questions/edit_inline"
import "./answers/new_answer_row"
import "./test_passing/timer"
import "./utilities/back_button"

import 'bootstrap'
import "@oddcamp/cocoon-vanilla-js";
import "trix"
import "@rails/actiontext"
import 'bootstrap-icons/font/bootstrap-icons.css'

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
let tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
