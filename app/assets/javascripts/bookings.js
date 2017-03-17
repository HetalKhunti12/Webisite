var ready;

$(function() {
  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };
  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };
  return $.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    html = "<div class=\"modal\" id=\"confirmationDialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n        <a class=\"close\" data-dismiss=\"modal\">×</a>\n        <h4><i class=\"glyphicon glyphicon-trash\"></i>  " + message + "</h4>\n      </div>\n      <div class=\"modal-footer\">\n        <a data-dismiss=\"modal\" class=\"btn\">Cancel</a>\n        <a data-dismiss=\"modal\" class=\"btn btn-danger confirm\">Ok</a>\n      </div>\n    </div>\n  </div>\n</div>";
    $(html).modal('show');
    return $('#confirmationDialog .confirm').on('click', function() {
      return $.rails.confirmed(link);
    });
  };
});

ready = function() {
  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  $("body").on("click", ".add_fields", function() {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    addServiceOrderCallbacks();
    return event.preventDefault();
  });
  $("body").on("click", ".add_profile_order_fields", function() {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    addCallbacks();
    addProfileOrderCallbacks();
    return event.preventDefault();
  });
  $("body").on("click", ".add_cust_invoice", function() {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    $(".add_cust_invoices").hide();
    addCallbacks();
    setCustInvDefaults();
    return event.preventDefault();
  });
  $("body").on("click", ".add_cust_invoices", function() {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    $(".add_cust_invoices").hide();
    addCallbacks();
    setCustInvoicesDefaults();
    return event.preventDefault();
  });
  $("body").on("click", ".add_cust_payments", function() {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    addCallbacks();
    setCustPayments();
    return event.preventDefault();
  });
  $("body").on("click", ".add_inquiry_profile", function(evt) {
    var regexp, time;
    evt.stopImmediatePropagation();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return addInquiryCallbacks();
  });
  $("body").on("click", ".add_transfer", function() {
    var finance_id, regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    finance_id = $(this).closest(".finance_entoz").attr('id');
    addCallbacks();
    setTransferDefaults(finance_id);
    return event.preventDefault();
  });
  return $("body").on("click", ".add_invoice", function() {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    addCallbacks();
    setProfilePaymentDefaults();
    return event.preventDefault();
  });
};

$(document).ready(ready);

$(document).on('page:load', ready);