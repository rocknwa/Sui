module hello_web3::hello_web3_tests {
    use std::string;
    use std::debug;
    use sui::test_scenario;
    use sui::tx_context::{self, TxContext};
    use hello_web3::hello_web3;

    #[test]
    fun test_mint_and_text() {
        let mut scenario = test_scenario::begin();
        let sender = @0x1;
        let ctx = &mut test_scenario::ctx(&mut scenario, sender);

        // Call mint
        hello_web3::mint(ctx);

        // Extract objects owned by sender
        let objs = test_scenario::take_owned_objects(&mut scenario, sender);

        // We expect exactly one object minted
        assert!(vector::length(&objs) == 1, 1);

        // Downcast the object to HelloWeb3Object
        let obj = vector::pop_back(&mut objs);
        let hw3_obj = object::borrow_as<&hello_web3::HelloWeb3Object>(&obj);

        // Test get_text()
        let text = hello_web3::get_text(hw3_obj);
        debug::print(&text);
        assert!(text == string::utf8(b"Hello Web3!"), 2);

        // Test has_expected_text()
        assert!(hello_web3::has_expected_text(hw3_obj), 3);

        test_scenario::end(scenario);
    }
}
