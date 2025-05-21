// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import { Test, console } from "forge-std/Test.sol";
import { EntryPointDeployer, IEntryPoint } from "entrypoint/Deployer.sol";
import { NexusDeployer, INexus, IValidator, INexusFactory } from "../src/Deployer.sol";

contract NexusTest is Test, EntryPointDeployer, NexusDeployer {
    IEntryPoint entryPoint;
    NexusDeployment nexus;

    address nexusFactoryOwner = makeAddr("nexusFactoryOwner");

    address owner = makeAddr("owner");

    function setUp() external {
        entryPoint = deployEntryPoint();
    }

    // function testDeployNexusImplementation() external {
    //     IValidator validator = deployNexusDefaultValidator();
    //     deployNexusImplementation(address(entryPoint), address(validator), "");
    // }

    // function testDeployNexusAccountFactory() external {
    //     IValidator validator = deployNexusDefaultValidator();
    //     INexus nexusImplementation = deployNexusImplementation(address(entryPoint), address(validator), "test");
    //     INexusFactory nexusFactory = deployNexusAccountFactory(address(nexusImplementation), nexusFactoryOwner);
    //     assertEq(nexusFactory.owner(), nexusFactoryOwner, "invalid owner");
    // }

    function testEtchNexusImplementation() external {
        INexus impl = etchNexusImplementation();
        assertEq(impl.entryPoint(), 0x0000000071727De22E5E9d8BAf0edAc6f37da032, "Invalid");
    }

    function testEtchNexusAccountFactory() external {
        INexus impl = etchNexusImplementation();
        INexusFactory factory = etchNexusAccountFactory();
        assertEq(factory.owner(), address(0), "invalid owner");
        assertEq(factory.ACCOUNT_IMPLEMENTATION(), address(impl), "invalid implementation");
    }
}
