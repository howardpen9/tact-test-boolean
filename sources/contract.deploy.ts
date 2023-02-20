import { beginCell, contractAddress, toNano, Address } from "ton";
import { testAddress } from "ton-emulator";
import { SampleTactContract } from "./output/sample_SampleTactContract";
import { deploy } from "./utils/deploy";
import { printAddress, printDeploy, printHeader } from "./utils/print";

(async () => {
    // Parameters
    let sender1 = Address.parse("A"); // Replace owner with your address
    let sender2 = Address.parse("B"); // Replace owner with your address

    let init = await SampleTactContract.init(sender1, sender2);
    let address = contractAddress(0, init);
    let deployAmount = toNano("0.1");
    let testnet = true;

    // Print basics
    printHeader("SampleTactContract");
    printAddress(address);
    // printDeploy(init, deployAmount, packed, testnet);

    // Do deploy
    await deploy(init, deployAmount, "A", testnet);
})();
