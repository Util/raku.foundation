unit module RakuFoundation::MemberForm;

use Air::Functional :BASE;
use Air::Base;
use Air::Form;

class Member does Form is export {
    has Str $.name  is validated(%va<names>) is required;
    has Str $.nick  is validated(%va<name>);
    has Str $.email is validated(%va<email>) is email is required;

    method do-form-attrs {
        self.form-attrs: {:submit-button-text('Register Interest')}
    }

    method validate-form {}

    method form-routes {
        self.init;

        self.submit: -> Member $form {
            if $form.is-valid {
                note "Member registration: $form.form-data()";
                self.finish: '<b style="text-align:center"><em>Thank you — we will be in touch!</em></b>'
            }
            else {
                self.retry: $form
            }
        }
    }
}

our $member is export = Member.empty;
