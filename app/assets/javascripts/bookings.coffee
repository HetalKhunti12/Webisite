# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 
 $ ->
   $.rails.allowAction = (link) ->
     return true unless link.attr('data-confirm')
     $.rails.showConfirmDialog(link) 
     false 

   $.rails.confirmed = (link) ->
     link.removeAttr('data-confirm')
     link.trigger('click.rails')

   $.rails.showConfirmDialog = (link) ->
     message = link.attr 'data-confirm'
     html = """
            <div class="modal" id="confirmationDialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <a class="close" data-dismiss="modal">×</a>
                    <h4><i class="glyphicon glyphicon-trash"></i>  #{message}</h4>
                  </div>
                  <div class="modal-footer">
                    <a data-dismiss="modal" class="btn">Cancel</a>
                    <a data-dismiss="modal" class="btn btn-danger confirm">Ok</a>
                  </div>
                </div>
              </div>
            </div>
            """
     $(html).modal('show')
     $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)
     
 ready = ->
   $('form').on 'click', '.remove_fields', (event) ->
     $(this).prev('input[type=hidden]').val('1')
     $(this).closest('fieldset').hide()
     event.preventDefault()
          
# needed for modal
   $("body").on "click", ".add_fields", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      addServiceOrderCallbacks()
      event.preventDefault()
      
# needed for modal
   $("body").on "click", ".add_profile_order_fields", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      addCallbacks()
      addProfileOrderCallbacks()  
      event.preventDefault()
      
    

# needed for modal
   $("body").on "click", ".add_cust_invoice", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      $(".add_cust_invoices").hide()
      addCallbacks()
      setCustInvDefaults()
      event.preventDefault()

# needed for modal
   $("body").on "click", ".add_cust_invoices", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      $(".add_cust_invoices").hide()
      addCallbacks()
      setCustInvoicesDefaults()
      event.preventDefault()
 

# needed for modal
   $("body").on "click", ".add_cust_payments", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      addCallbacks()
      setCustPayments()
      event.preventDefault()

# needed for modal
   $("body").on "click", ".add_inquiry_profile", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      $(this).closest(".inquiry-top-section").find('.billingtoo:last').css 'display', 'block'
      $(this).closest(".inquiry-top-section").find(".label_checkbox:last").css 'display', 'block'
      addInquiryCallbacks()
      event.preventDefault()      
      
# needed for modal
   $("body").on "click", ".add_transfer", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      finance_id = $(this).closest(".finance_entoz").attr('id')
      addCallbacks()
      setTransferDefaults(finance_id)
      event.preventDefault()      
      
      
# needed for modal
   $("body").on "click", ".add_invoice", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      addCallbacks()
      setProfilePaymentDefaults()
      event.preventDefault()

   $("body").on "click", ".add_extra_invoice", (event)->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      objj = $(this)
      $(this).before($(this).data('fields').replace(regexp, time))
      addCallbacks()
      setProfileExtraPaymentDefaults(objj)
      event.preventDefault()
 
 $(document).ready(ready)
 $(document).on('page:load', ready)
 
 
 
 
 