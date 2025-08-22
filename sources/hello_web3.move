 module hello_web3::hello_web3 {

    use std::string;
     

    
    public struct HelloWeb3Object has key, store {
        id: UID,
        text: string::String
    }

    #[allow(lint(self_transfer))]
    public fun mint(ctx: &mut TxContext) {
        let object = HelloWeb3Object {
            id: object::new(ctx),
            text: string::utf8(b"Hello Web3!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
   
    public fun get_text(object: &HelloWeb3Object): string::String {
        object.text
    }

    public fun has_expected_text(object: &HelloWeb3Object): bool {
        let expected = string::utf8(b"Hello Web3!");
        object.text == expected
    }

     // ✅ Simple inline test
    #[test]
    fun test_has_expected_text() {
        let obj = HelloWeb3Object {
            id: object::new_for_testing(),
            text: string::utf8(b"Hello Web3!")
        };
        assert!(has_expected_text(&obj), 1);
    }
}
