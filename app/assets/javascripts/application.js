//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-select/dist/js/bootstrap-select
//= require bootstrap-toggle/js/bootstrap-toggle.min
//= require corejs-typeahead/dist/typeahead.bundle
//= require underscore/underscore
//= require listjs/dist/list
//= require moment/moment
//= require moment/locale/es
//= require sweetalert2
//= require rails-sweetalert2-confirm
//= require turbolinks
//= require_tree .

window.sweetAlertConfirmDefaults = {
    sweetSelector: '[data-swal]',
    text: 'La operación es irreversible',
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: '<i class="fa fa-trash"></i> Sí',
    cancelButtonText: "Cancelar"
};