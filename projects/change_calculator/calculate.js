"use strict";
$(document).ready(function(){

    var checkValuePattern = /^(\d?[0-9]|[0-9]0)$/; //Regular expression to make sure the cents is 0 to 99
    

    $("#calculate").click( function() {
        
        var cents = $("#cents").val();
        

        if(cents == "") //Validate for empty string
        {
            $("#cents").next().text("This field is required.");
            $("#quarters").val("");
            $("#dimes").val("");
            $("#nickels").val("");
            $("#pennies").val("");
        }
        else if(isNaN($("#cents").val())) //Validate for not a number
        {
            $("#cents").next().text("This field must be numeric.");
            $("#quarters").val("");
            $("#dimes").val("");
            $("#nickels").val("");
            $("#pennies").val("");
        }
        else if(!checkValuePattern.test(cents))
        {
            alert("Please enter a valid number between 0 and 99");
            $("#cents").next().text("Must be a number between 0 and 99.");
            $("#quarters").val("");
            $("#dimes").val("");
            $("#nickels").val("");
            $("#pennies").val("");
        }
        else
        {
            $("#cents").next().text("");

            var quarters = Math.floor(cents/25);
            $("#quarters").val(quarters);

            cents = cents - (25 * quarters);

            var dimes = Math.floor(cents/10);
            $("#dimes").val(dimes);

            cents = cents - (10 * dimes);

            var nickels = Math.floor(cents/0o5); //The letter o is because octal literals cannot be used in strict mode
            $("#nickels").val(nickels);

            cents = cents - (0o5 * nickels);

            var pennies = Math.floor(cents/0o1); //The letter o is because octal literals cannot be used in strict mode
            $("#pennies").val(pennies);
        }

        //BOOYAH!!!

    }); // end click() method
    
    // set focus on cents text box on initial load
    $("#cents").focus();
    
}); // end ready() method