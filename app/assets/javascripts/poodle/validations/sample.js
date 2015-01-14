function validateSampleForm() {

    $('#form_sample').validate({
      debug: true,
      rules: {
        "sample[first_name]": {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        "sample[last_name]": {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        "sample[email]": {
            required: true,
            email: true
        },
      },
      errorElement: "span",
      errorClass: "help-block",
      messages: {
        "sample[first_name]": "Please specify First Name",
        "sample[last_name]": "Please specify Last Name",
        "sample[email]": {
            required: "We need your email address to contact you",
            email: "Your email address must be in the format of name@domain.com"
        },
      },
      highlight: function(element) {
          $(element).parent().parent().addClass("has-error");
      },
      unhighlight: function(element) {
          $(element).parent().parent().removeClass("has-error");
      },
      invalidHandler: function(event, validator) {
        // 'this' refers to the form
        var errors = validator.numberOfInvalids();
        if (errors) {

          // Populating error message
          var errorMessage = errors == 1
            ? 'You missed 1 field. It has been highlighted'
            : 'You missed ' + errors + ' fields. They have been highlighted';

          // Removing the form error if it already exists
          $("#div_sample_js_validation_error").remove();

          errorHtml = "<div id='div_sample_js_validation_error' class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
          //$("#div_sample_details").prepend(errorHtml);
          $("#div_modal_generic div.modal-body-main").prepend(errorHtml);

          // Show error labels
          $("div.error").show();

        } else {
          // Hide error labels
          $("div.error").hide();
          // Removing the error message
          $("#div_sample_js_validation_error").remove();
        }
      }

    });

}
