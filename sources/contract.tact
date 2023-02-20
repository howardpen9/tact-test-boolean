
contract SampleTactContract with  {
    case_a: Bool; 
    case_b: Bool; 
    counter: Int;

    sender_1: Address;
    sender_2: Address; 

    init(sender_1: Address, sender_2: Address) {
        self.sender_1 = sender_1;
        self.sender_2 = sender_2;
        self.counter = 0;
        self.case_a = false;
        self.case_b = false;
    }

   receive("A") {
        let ctx: Context = context();
        if (ctx.sender == self.sender_1) {
            self.case_a = true;
            self.counter = self.counter + 1;
        }
        else if (ctx.sender == self.sender_2) {
            self.case_b = true;
            self.counter = self.counter + 1;
        }

        if (self.case_a == true && self.case_b == true) {
           send(SendParameters {
                to: self.sender_1,
                value: 0,
                mode: SendIgnoreErrors + SendRemainingBalance,
                body: "Legit".asComment()
            });
        }
    }
}