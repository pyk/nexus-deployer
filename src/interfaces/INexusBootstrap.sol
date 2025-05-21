// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { IERC7484 } from "./IERC7484.sol";

/// @title NexusBootstrap Configuration for Nexus
/// @notice Provides configuration and initialization for Nexus smart accounts.
/// @author @livingrockrises | Biconomy | chirag@biconomy.io
/// @author @aboudjem | Biconomy | adam.boudjemaa@biconomy.io
/// @author @filmakarov | Biconomy | filipp.makarov@biconomy.io
/// @author @zeroknots | Rhinestone.wtf | zeroknots.eth
/// Special thanks to the Solady team for foundational contributions: https://github.com/Vectorized/solady
struct BootstrapConfig {
    address module;
    bytes data;
}

struct BootstrapPreValidationHookConfig {
    uint256 hookType;
    address module;
    bytes data;
}

struct RegistryConfig {
    IERC7484 registry;
    address[] attesters;
    uint8 threshold;
}

interface INexusBootstrap {
    /// @notice Initializes the Nexus account with the default validator.
    /// No registry is needed for the default validator.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @dev For gas savings purposes this method does not initialize the registry.
    /// @dev The registry should be initialized via the `setRegistry` function on the Nexus contract later if needed.
    /// @param data The initialization data for the default validator module.
    function initNexusWithDefaultValidator(bytes calldata data) external payable;

    // ================================================
    // ===== DEFAULT VALIDATOR + OTHER MODULES =====
    // ================================================

    /// @notice Initializes the Nexus account with the default validator and other modules and no registry.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param defaultValidatorInitData The initialization data for the default validator module.
    /// @param executors The configuration array for executor modules.
    /// @param hook The configuration for the hook module.
    /// @param fallbacks The configuration array for fallback handler modules.
    function initNexusWithDefaultValidatorAndOtherModulesNoRegistry(
        bytes calldata defaultValidatorInitData,
        BootstrapConfig[] calldata validators,
        BootstrapConfig[] calldata executors,
        BootstrapConfig calldata hook,
        BootstrapConfig[] calldata fallbacks,
        BootstrapPreValidationHookConfig[] calldata preValidationHooks
    )
        external
        payable;

    /// @notice Initializes the Nexus account with the default validator and other modules.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param defaultValidatorInitData The initialization data for the default validator module.
    /// @param executors The configuration array for executor modules.
    /// @param hook The configuration for the hook module.
    /// @param fallbacks The configuration array for fallback handler modules.
    /// @param registryConfig The registry configuration.
    function initNexusWithDefaultValidatorAndOtherModules(
        bytes calldata defaultValidatorInitData,
        BootstrapConfig[] calldata validators,
        BootstrapConfig[] calldata executors,
        BootstrapConfig calldata hook,
        BootstrapConfig[] calldata fallbacks,
        BootstrapPreValidationHookConfig[] calldata preValidationHooks,
        RegistryConfig memory registryConfig
    )
        external
        payable;

    // ================================================
    // ===== SINGLE VALIDATOR =====
    // ================================================

    /// @notice Initializes the Nexus account with a single validator and no registry.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param validator The address of the validator module.
    /// @param data The initialization data for the validator module.
    function initNexusWithSingleValidatorNoRegistry(address validator, bytes calldata data) external payable;

    /// @notice Initializes the Nexus account with a single validator.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param validator The address of the validator module.
    /// @param data The initialization data for the validator module.
    /// @param registryConfig The registry configuration.
    function initNexusWithSingleValidator(
        address validator,
        bytes calldata data,
        RegistryConfig memory registryConfig
    )
        external
        payable;

    // ================================================
    // ===== GENERALIZED FLOW =====
    // ================================================

    /// @notice Initializes the Nexus account with multiple modules and no registry.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param validators The configuration array for validator modules.
    /// @param executors The configuration array for executor modules.
    /// @param hook The configuration for the hook module.
    /// @param fallbacks The configuration array for fallback handler modules.
    function initNexusNoRegistry(
        BootstrapConfig[] calldata validators,
        BootstrapConfig[] calldata executors,
        BootstrapConfig calldata hook,
        BootstrapConfig[] calldata fallbacks,
        BootstrapPreValidationHookConfig[] calldata preValidationHooks
    )
        external
        payable;

    /// @notice Initializes the Nexus account with multiple modules.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param validators The configuration array for validator modules.
    /// @param executors The configuration array for executor modules.
    /// @param hook The configuration for the hook module.
    /// @param fallbacks The configuration array for fallback handler modules.
    /// @param registryConfig The registry configuration.
    function initNexus(
        BootstrapConfig[] calldata validators,
        BootstrapConfig[] calldata executors,
        BootstrapConfig calldata hook,
        BootstrapConfig[] calldata fallbacks,
        BootstrapPreValidationHookConfig[] calldata preValidationHooks,
        RegistryConfig memory registryConfig
    )
        external
        payable;

    // ================================================
    // ===== SCOPED FLOW =====
    // ================================================

    /// @notice Initializes the Nexus account with a scoped set of modules and no registry.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param validators The configuration array for validator modules.
    /// @param hook The configuration for the hook module.
    function initNexusScopedNoRegistry(
        BootstrapConfig[] calldata validators,
        BootstrapConfig calldata hook
    )
        external
        payable;

    /// @notice Initializes the Nexus account with a scoped set of modules.
    /// @dev Intended to be called by the Nexus with a delegatecall.
    /// @param validators The configuration array for validator modules.
    /// @param hook The configuration for the hook module.
    /// @param registryConfig The registry configuration.
    function initNexusScoped(
        BootstrapConfig[] calldata validators,
        BootstrapConfig calldata hook,
        RegistryConfig memory registryConfig
    )
        external
        payable;
}
