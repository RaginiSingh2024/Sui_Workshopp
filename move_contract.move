/*
/// Module: move_contract
module move_contract::move_contract;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_address::my_nft {
    use sui::object;
    use sui::transfer;
    use sui::tx_context;
    use std::string::{String};

    public struct MyNFT has key, store {
        id: object::UID,
        name: String,
        description: String,
        image_url: String
    }

    public entry fun mint(
        name: String,
        description: String,
        image_url: String,
        ctx: &mut tx_context::TxContext
    ) {
        let nft = MyNFT {
            id: object::new(ctx),
            name,
            description,
            image_url
        };
        transfer::transfer(nft, tx_context::sender(ctx));
    }
}