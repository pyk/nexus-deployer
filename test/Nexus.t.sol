// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import { Test, console } from "forge-std/Test.sol";
import { EntryPointDeployer, IEntryPoint } from "entrypoint/Deployer.sol";
import { NexusDeployer } from "../src/Deployer.sol";

contract NexusTest is Test, EntryPointDeployer, NexusDeployer {
    function setUp() external { }
}
