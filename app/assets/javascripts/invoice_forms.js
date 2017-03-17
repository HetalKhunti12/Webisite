(function($) {

    $.fn.focusNextInputField = function() {
        return this.each(function() {
            var fields = $(this).parents('form:eq(0),body').find('button,input,textarea,select');
            var index = fields.index(this);
            if (index > -1 && (index + 1) < fields.length) {

                fields.eq(index + 1).focus();
            }
            return false;
        });
    };
    
})(jQuery);

function addArtistProfileCallbacks(){
  var sub_id = $(".sub_category_id").val();
  var id = $("#artist_profile_category_id").val();
  if(sub_id != ""){
    $.ajax({
      type: "GET",
      url: '/edit_sub_category/'+ id + '/' + sub_id,
      dataType: "script"
    });
  }
}

function addContactCallbacks(){
  var st_id = $(".work_state").val();
  var con_id = $("#contact_work_country").val();
  if(st_id != ""){
    $.ajax({
      type: "GET",
      url: '/edit_states/'+ con_id + '/' + st_id,
      dataType: "script"
    });
  }
}



function getGstExcArtistFee(po_index) {
  total = $('#Z' + String.fromCharCode(po_index+65) + '3').text();
  return parseFloat(total).toFixed(2);
}

function getGstOnArtistFee(po_index,has_gst) {
  if (has_gst == 'false'){
    return parseFloat(0).toFixed(2);
  } else {
    total = $('#Z' + String.fromCharCode(po_index+65) + '6').text();
    return parseFloat(total).toFixed(2);
  }  
}
function getTotalArtistFee(po_index, gst) {
  preGst = getGstExcArtistFee(po_index);
  gst_value = getGstOnArtistFee(po_index,gst);
  total = parseFloat(preGst) + parseFloat(gst_value);
  
  return total.toFixed(2);

  //gst = $('#Z' + String.fromCharCode(po_index+65) + '1').text();
}


function getInvoiceValue(text,divideby) {
  text = text.replace(/,/g, "");
  total = parseFloat(text);
  if (total>0 && divideby>0){
    return (total/divideby);
  }
}

function addCommunicationInquiryCallbacks(){
  
  $('[data-provide="typeahead"]').each(function(){
    
      var $this = $(this);
      $this.typeahead({
       source: function (query, process) {
            return $.get('/contacts/autocomplete_contact_name?q=' + query, function (data) {
                objects = [];
                map = {};
                $.each(data, function(i, object) {
                   map[object.name] = object;
                   objects.push(object.name);
                });
                console.log(data);
                process(objects);
                
            });    
        },
        updater: function (item) {
            selected_id = map[item].id;
            old_invoicing = map[item].old_invoicing,

            invoicing_with_gst = map[item].invoicing_with_gst,
            console.log(map[item]);
            var element_id = $this.attr("id");
            console.log(element_id);
            if(element_id == "artist_name_artist_name"){
              $("#inquiry_inquiry_profiles_attributes_0_contact_id").val(selected_id);
              if(old_invoicing == true){
                $("#inquiry_inquiry_profiles_attributes_0_old_invoicing").attr('checked', 'checked');
              }
              if(invoicing_with_gst == true){
                $("#inquiry_inquiry_profiles_attributes_0_invoicing_with_gst").attr('checked', 'checked');
              }
            }
            else{
              this_section = $this.closest('.inquiry-profile-top-section');
              this_section.find(".contact_id").val(selected_id);
              if(old_invoicing == true){
                this_section.find(".old_invoicing").attr('checked', 'checked');
              }
              if(invoicing_with_gst == true){
                this_section.find(".invoicing_with_gst").attr('checked', 'checked');
              }
            }
            return item;
        }
    });
  });
}

function getArtistInvoiceNumber(prefix,booking_number,type,index){
  suffice = String.fromCharCode(index+65);
  return prefix + "-" + booking_number + "-"+ suffice + "-" + type;  
}

function getCustomerInvoiceNumber(booking_number,type,index){
  suffice = String.fromCharCode(index+65);
  return "C" + "-" + booking_number + "-"+ suffice + "-" + type; 
}

function getArtistClassName(artist_index){
  return "A" + artist_index + "-artist_invoice_present"; 
}

function incrementArtistDate(date_str) {
    var parts = date_str.split("/");
    var dt = new Date(
        parseInt(parts[2], 10),      // year
        parseInt(parts[1], 10) - 1,  // month (starts with 0)
        parseInt(parts[0], 10)       // date
    );
      
    switch (dt.getDay()) {
      case 0: incrementor = 1;
      //sunday->mon
        break; 
      case 1: incrementor = 3;
      //monday->thursday
        break;
      case 2: incrementor = 2 ;
      //tuesday->thursady
        break;
      case 3: incrementor = 5;
      //wednesday->mon
        break; 
      case 4: incrementor = 4;
      //thursday->mon
        break; 
      case 5: incrementor = 3;
      //friday->mon
        break; 
      case 6: incrementor = 2;
      //sat->mon
        break; 
    }  
      
    dt.setTime(dt.getTime() + incrementor * 86400000);
    parts[2] = "" + dt.getFullYear();
    parts[1] = "" + (dt.getMonth() + 1);
    if (parts[1].length < 2) {
        parts[1] = "0" + parts[1];
    }
    parts[0] = "" + dt.getDate();
    if (parts[0].length < 2) {
        parts[0] = "0" + parts[0];
    }
    return parts.join("/");
};


function setProfilePaymentDefaults(){
  
  $( ".new_artist_invoice:last" ).val("Full Payment");
  next = $(".new_artist_invoice:last" ).focusNextInputField();
  
  po_id = $(".new_artist_invoice:last").closest("fieldset").parent().prev().val();
  po_id_index = parseInt($(".new_artist_invoice:last").closest("fieldset").parent().prev().prev().val());
 
  number_id = next.closest('.artist_payment').find('.invoice_number').attr("id");
  var numItems = $('.'+getArtistClassName(po_id_index)).length;
  //$('#'+number_id).val($(".new_invoice:last").closest("fieldset").parent().prev().prev().prev().prev().val());
  $('#'+number_id).val(getArtistInvoiceNumber('A'+po_id_index,$(".new_artist_invoice:last").closest("fieldset").parent().prev().prev().prev().prev().val(),'INV',numItems));

  amount_id = next.closest('.artist_payment').find('.artist_ex_gst').attr("id");
  $('#'+amount_id).val(getGstExcArtistFee(po_id_index));
  
  amount_gst = next.closest('.artist_payment').find('.artist_gst').attr("id");
  $('#'+amount_gst).val(getGstOnArtistFee(po_id_index,$(".new_artist_invoice:last").closest("fieldset").parent().prev().prev().prev().prev().prev().val()));

  date_due_id = next.closest('.artist_payment').find('.date_due').attr("id");
  //$('#'+date_due_id).val($(".new_artist_invoice:last").closest("fieldset").parent().prev().prev().prev().val());
  $('#'+date_due_id).val(incrementArtistDate($(".new_artist_invoice:last").closest("fieldset").parent().prev().prev().prev().val()));
  
  $(".new_artist_invoice:last").focus();
  $(".new_artist_invoice").addClass(getArtistClassName(po_id_index)); 
  $(".new_artist_invoice").removeClass("new_artist_invoice");  
  // $('#'+date_id).focusNextInputField();
  // amount_id = $(document.activeElement).attr("id");
  // $('#'+amount_id).val(getGstExcArtistFee(po_id_index));
}

function setTransferDefaults(finance_id){
  
  next = $("#"+finance_id).find(".new_transfer:last" ).focusNextInputField();


  commission_ex_gst = next.closest('.transfer').find('.commission_ex_gst').attr("id");
  commission_gst = next.closest('.transfer').find('.commission_gst').attr("id");
  exp_comm_ex_gst_total = next.closest('.transfer').find('.exp_comm_ex_gst_total').attr("id");
  exp_comm_total = parseFloat($("#"+finance_id).find('#exp_comm_ex_gst_total').text(), 0.00) || 0;
  comm_total = parseFloat($("#"+finance_id).find('#commission_ex_gst_total').text(), 0.00) + exp_comm_total;  
  
  exp_comm_gst_total = next.closest('.transfer').find('.exp_comm_gst_total').attr("id");
  exp_comm_gst_total = parseFloat($("#"+finance_id).find('#exp_comm_gst_total').text(), 0.00) || 0;
  comm_gst_total = parseFloat($("#"+finance_id).find('#commission_gst_total').text(), 0.00) + exp_comm_gst_total;
  
  $('#'+commission_ex_gst).val(comm_total);
  $('#'+commission_gst).val(comm_gst_total);
    
  ent_oz_exp_ex_gst = next.closest('.transfer').find('.ent_oz_exp_ex_gst').attr("id");
  ent_oz_exp_ex_gst_total = parseFloat($("#"+finance_id).find('#ent_oz_exp_ex_gst_total').text(), 0.00) || 0;
  $('#'+ent_oz_exp_ex_gst).val(ent_oz_exp_ex_gst_total);
 
  ent_oz_exp_gst = next.closest('.transfer').find('.ent_oz_exp_gst').attr("id");
  ent_oz_exp_gst_total = parseFloat($("#"+finance_id).find('#ent_oz_exp_gst_total').text(), 0.00) || 0;
  $('#'+ent_oz_exp_gst).val(ent_oz_exp_gst_total);

  
}

function setCustInvDefaults(){
  var numItems = $('.customer_payment').length -1;
  setCustSingleInvoice("Full Payment",
                       getInvoiceValue($('#Y9').text(),1),
                       $("#booking_form_returned").val(),
getCustomerInvoiceNumber($(".new_cust_invoice:first").closest("fieldset").parent().prev().prev().val(),'INV',numItems));
}

function toDate(dateStr) {
    var parts = dateStr.split("/");
    return new Date(parts[2], parts[1] - 1, parts[0]);
}

function ddmmyyyy(dateIn) {
  var yyyy = dateIn.getFullYear();
  var mm = dateIn.getMonth() < 9 ? "0" + (dateIn.getMonth() + 1) : (dateIn.getMonth() + 1); // getMonth() is zero-based
  var dd  = dateIn.getDate() < 10 ? "0" + dateIn.getDate() : dateIn.getDate();
  return "".concat(dd).concat("/").concat(mm).concat("/").concat(yyyy);
 };

function setCustInvoicesDefaults(){
  date = new Date();

  //var bcd_str = $(".new_cust_invoice:first").closest("fieldset").parent().prev().prev().prev().val();
  var bcd_str = $("#booking_form_returned").val();
  var perf_str = $(".new_cust_invoice:first").closest("fieldset").parent().prev().val();
  
  var bcd_date = toDate(bcd_str);
  var perf_date = toDate(perf_str);
  var diff  = new Date(perf_date - bcd_date);
  var days  = diff/1000/60/60/24;

  var numItems = $('.customer_payment').length -1;
  var amount = getInvoiceValue($('#Y9').text(),1);
  
  var deposit_date_str;
  var balance_date_str;
  
  if (days<14){
    bcd_date.setDate(bcd_date.getDate() + 3);
    deposit_date_str = ddmmyyyy(bcd_date);
    setCustSingleInvoice("Full Payment",amount,deposit_date_str,
  getCustomerInvoiceNumber($(".new_cust_invoice:first").closest("fieldset").parent().prev().prev().val(),'INV',numItems));
  } else if (days<56) {
    bcd_date.setDate(bcd_date.getDate() + 7);
    deposit_date_str = ddmmyyyy(bcd_date);
    setCustSingleInvoice("Full Payment",amount,deposit_date_str,
  getCustomerInvoiceNumber($(".new_cust_invoice:first").closest("fieldset").parent().prev().prev().val(),'INV',numItems));
  } else {
    bcd_date.setDate(bcd_date.getDate() + 7);
    perf_date.setDate(perf_date.getDate() - 28)
    
    deposit_date_str = ddmmyyyy(bcd_date);
    balance_date_str = ddmmyyyy(perf_date);
    var amount = getInvoiceValue($('#Y9').text(),2);
    setDepositAndBalanceInvoices(deposit_date_str, balance_date_str);
  }
}

function setCustSingleInvoice(title,amount,date,number){
  $(".new_cust_invoice:last" ).val(title);
  $(".new_cust_invoice:last" ).focusNextInputField();

  date_id = $(document.activeElement).attr("id");
  $('#'+date_id).val(date);

  $('#'+date_id).focusNextInputField();
  amount_id = $(document.activeElement).attr("id");
  $('#'+amount_id).val(amount); 
  
  $('#'+amount_id).focusNextInputField();
  number_id = $(document.activeElement).attr("id");
  $('#'+number_id).val(number);

  $(".new_cust_invoice:last" ).focus();
  $(".new_cust_invoice").removeClass("new_cust_invoice"); 
}


function setDepositAndBalanceInvoices(deposit_date, balance_date){

  var numItems = $('.customer_payment').length -1;
  setCustSingleInvoice("Deposit",getInvoiceValue($('#Y9').text(),2), deposit_date,
                     getCustomerInvoiceNumber($(".new_cust_invoice:first").closest("fieldset").parent().prev().prev().val(),'INV',numItems));
  
  time = new Date().getTime();
  regexp = new RegExp($(".add_cust_invoices:last").data('id'), 'g');
  $(".add_cust_invoices:last").before($(".add_cust_invoices:last").data('fields').replace(regexp, time));
  
setCustSingleInvoice("Balance",getInvoiceValue($('#Y9').text(),2), balance_date,
                   getCustomerInvoiceNumber($(".new_cust_invoice:first").closest("fieldset").parent().prev().prev().val(),'INV',numItems+1));
  
}

function setCustPayments(){
  
    $('.payment_type').on('change', function() {
      var percent = 0; 
      var value = 0;
      var costr = 0;
      if (this.value == "amex"){
        percent = 2.9;
      } else if (this.value == "credit_card"){
        percent = 2.5;
      }  
      if (percent >0){
        cost = $(this).closest('.received_payment').find('.payment_amount').val() / (1+(percent/100));
        value = $(this).closest('.received_payment').find('.payment_amount').val()-cost;
      }
      $(this).closest('.received_payment').find('.surcharge').val(value.toFixed(2));
      
    })
}

function after_select_prof(id,this_element_id){    
  
  this_section = $("#"+this_element_id).closest('.booking-artist-section');
        
  $.getJSON('/contacts/'+id,
            "",
            function(data){
              this_section.find('.artist_email').val(data.work_email);
              this_section.find('.artist_phone').val(data.work_phone);
              this_section.find('.artist_mobile').val(data.mobile_phone);
              this_section.find('.artist_first_name').val(data.first_name);
              this_section.find('.artist_last_name').val(data.last_name);
              
              this_section.find('.artist_abn').val(data.abn);
              this_section.find('.artist_account').val(data.account);
              this_section.find('.artist_bsb').val(data.bsb);
     
              this_section.find('.artist_billing_name').val(data.billing_name);
              this_section.find('.artist_billing_address').val(data.billing_address_with_fallback);
              this_section.find('.gross_commission_percent').val(data.comission_percent);
          
              if (data.invoicing_with_gst == true){
                this_section.find('.invoicing_with_gst').prop('checked', true);
              } else {
                this_section.find('.invoicing_with_gst').prop('checked', false);
              }

              if (data.old_invoicing == true){
                this_section.find('.old_invoicing').prop('checked', true);
              } else {
                this_section.find('.old_invoicing').prop('checked', false);
              }
            }
        );            
}



function addServiceOrderCallbacks(){
  // $('button.magic-number').click(function () {
  //   $(this).closest('.booking-artist-section').find('.gross_comm_percent').val(21.56862);
  //   $('[id^=calx]').calx();
  // });
  addProfileOrderCallbacks();
}

function addInquiryCallbacks(){

  $('[data-provide="typeahead"]').each(function(){
      var $this = $(this);
      $this.typeahead({
       source: function (query, process) {
            return $.get('/contacts/autocomplete_contact_name?q=' + query, function (data) {
                objects = [];
                map = {};
                $.each(data, function(i, object) {
                   map[object.name] = object;
                   objects.push(object.name);
                });
                console.log(data);
                process(objects);
                
            });    
        },
        updater: function (item) {
            selected_id = map[item].id;
            console.log(map[item]);
            var element_id = $this.attr("id");
            console.log(element_id);
            if(element_id == "artist_name_artist_name"){
              $("#inquiry_inquiry_profiles_attributes_0_contact_id").val(selected_id);
            }
            else{
              this_section = $this.closest('.inquiry-profile-top-section');
              this_section.find(".contact_id").val(selected_id);
            }
            return item;
        }
    });
  });

  $(".start-date-cl").on("dp.change", function (e) {   
     $(this).closest('.booking-top-section').find('.end-date-cl').data("DateTimePicker").date(e.date);
     calculateInquiryDuration($(this),$(this).closest('.booking-top-section').find('.end-date-cl'));
  });
  
  $(".end-date-cl").on("dp.change", function (e) { 
    calculateInquiryDuration($(this).closest('.booking-top-section').find('.start-date-cl'),$(this));
  });

  

  
}

function addProfileOrderCallbacks(){
    
  $('[data-provide="typeahead"]').each(function(){
      var $this = $(this);
      $this.typeahead({
       source: function (query, process) {
            return $.get('/contacts/autocomplete_contact_name?q=' + query, function (data) {
                objects = [];
                map = {};
                $.each(data, function(i, object) {
                   map[object.name] = object;
                   objects.push(object.name);
                });
                console.log(data);
                process(objects);
                
            });    
        },
        updater: function (item) {
            selected_id = map[item].id;
            console.log(map[item]);
            var element_id = $this.attr("id");
            console.log(element_id);
            after_select_prof(selected_id,element_id);
            return item;
        }
    });
  });
  
    $('.datepick').datetimepicker({
      sideBySide: true
    });
      
    
    $(".start-datetime").on("dp.change", function (e) {   
       $(this).closest('.so-section').find('.end-datetime').data("DateTimePicker").date(e.date);
       calculateDuration($(this),$(this).closest('.so-section').find('.end-datetime'));
    });
    
    $(".end-datetime").on("dp.change", function (e) { 
      // alert('end start');     
      calculateDuration($(this).closest('.so-section').find('.start-datetime'),$(this));
    });
      
    $(".access-datetime").on("dp.change", function (e) {  
       $(this).closest('.booking-artist-section').find('.sound-check-datetime').data("DateTimePicker").date(e.date);
       $(this).closest('.booking-artist-section').find('.guest-datetime').data("DateTimePicker").date(e.date);
    });
    
    setBandDetails();
  
    $( "#profile_type" ).change(function() {
      setBandDetails();
    });
         
}


function setBandDetails(){
  if ($.inArray($( "#profile_type option:selected" ).text(), ['Band','Other']) >= 0) {
    $(".band_details_panel").show("slow");
  } else{
    $(".band_details_panel").hide("slow");
  }
}

function calculateDuration(start_field, end_field){
  
  var d1 = new Date(start_field.data("DateTimePicker").date());
  var d2 = new Date(end_field.data("DateTimePicker").date());

     var onemin = 60*1000;
     var diff = 0;
     var text ="";
     var mintext ="";
     var hrText="";
     var hrs="";
     if (d1 && d2) {
  
       diff = Math.round(Math.abs((d2.getTime() - d1.getTime())/(onemin)));
       if (diff>59){
         hrText = " hr ";
         hrValue = Math.floor(diff/60);
         if (diff>119){
           hrText = " hrs ";
         } 
         hrs = hrValue + hrText;
       }
       
       var mins = diff % 60;
       if (mins>0){
         mintext = mins + " mins"
       }
       
     }
     //alert(hrs + mintext);
     
     start_field.closest('.so-section').find('.perf_duration').val(hrs + mintext);
  
}

function calculateInquiryDuration(start_field, end_field){
  
  var d1 = new Date(start_field.data("DateTimePicker").date());
  var d2 = new Date(end_field.data("DateTimePicker").date());

     var onemin = 60*1000;
     var diff = 0;
     var text ="";
     var mintext ="";
     var hrText="";
     var hrs="";
     if (d1 && d2) {
  
       diff = Math.round(Math.abs((d2.getTime() - d1.getTime())/(onemin)));
       if (diff>59){
         hrText = " hr ";
         hrValue = Math.floor(diff/60);
         if (diff>119){
           hrText = " hrs ";
         } 
         hrs = hrValue + hrText;
       }
       
       var mins = diff % 60;
       if (mins>0){
         mintext = mins + " mins"
       }
       
     }
     //alert(hrs + mintext);
     
     start_field.closest('.booking-top-section').find('.performance_length').val(hrs + mintext);
  
}


