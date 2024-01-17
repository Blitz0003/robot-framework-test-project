*** Settings ***
Resource          automation-shared-resources/api-utilities.robot
Resource          automation-shared-resources/general-utilities.robot
Resource          automation-shared-resources/mapper-utilities.robot
Resource          automation-shared-resources/mock-utilities.robot
Resource          environment.robot

*** Variables ***
${scenario_name}    Success Flow
${required_scenario_state}    Started
${new_scenario_state}    Started

*** Keywords ***
Client Id is provided
    Set Test Variable    ${client_id}    test-client-123    # used by WHEN keyword
    Set Test Variable    ${client}    test-client-123    # used by mocks

Transaction Id is not provided
    Set Test Variable    ${transaction_id}    none

Error Message Is Returned
    [Arguments]    ${code}    ${message}    ${index}=0
    Verify That Json Value Is Correct    json_path=$.errors.[${index}].code    expected_json_value="${code}"
    Verify That Json Value Is Correct    json_path=$.errors.[${index}].message    expected_json_value="${message}"

Unauthorized Error Message Is Returned
    Verify That Json Value Is Correct    json_path=$.message    expected_json_value="Unauthorized"

Delete Wiremock Stubs
    ${is_mock}    Run Keyword And Return Status    Should Contain    ${TEST_TAGS}    mock
    Run Keyword If    "${is_mock}" == "True"    Bulk Delete Wiremock Stubs
    Reset Mock Scenario

Set Mock Scenario
    [Arguments]    ${scenario_name}    ${required_scenario_state}    ${new_scenario_state}
    Set Test Variable    ${scenario_name}
    Set Test Variable    ${required_scenario_state}
    Set Test Variable    ${new_scenario_state}

Reset Mock Scenario
    Create Session    ins    ${${env}_wiremock_host}    verify=True
    ${mock_response}    Post Request    ins    /__admin/scenarios/reset
    Set Suite Variable    ${mock_response}
    Log    ${mock_response.text}
    [Teardown]    Delete All Sessions

Verify That Field Is Successfully Mapped
    [Arguments]    ${field_name}
    Verify That Field Is Correctly Mapped    ${field_name}    null_field_value=none    missing_field_value=none

Verify That Field Is Successfully Mapped To Target List
    [Arguments]    ${field_name}
    Verify That Field Is Correctly Mapped To Target List    ${field_name}    null_field_value=none    missing_field_value=none
