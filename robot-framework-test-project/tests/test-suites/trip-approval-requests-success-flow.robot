*** Settings ***
Suite Setup       Open MongoDB
Suite Teardown    Close MongoDB
Force Tags        success-flow
Resource          resources/trip-approval-requests.robot

*** Test Cases ***
01_Verify that user can send his trip approval request when all of the required fields are populated and has one AIR segment
    Given Trip approval requests request parameters    air_segments=1    car_segments=0    hotel_segments=0    rail_segments=0    trip_route=ONE_WAY    request_date_time=local
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created

02_Verify that user can send his trip approval request when all of the required fields are populated and has one CAR segment
    Given Trip approval requests request parameters    air_segments=0    car_segments=1    hotel_segments=0    rail_segments=0    trip_route=ONE_WAY    request_date_time=utc
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created

03_Verify that user can send his trip approval request when all of the required fields are populated and has one HOTEL segment
    Given Trip approval requests request parameters    air_segments=0    car_segments=0    hotel_segments=1    rail_segments=0    trip_route=ONE_WAY    request_date_time=local
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created

04_Verify that user can send his trip approval request when all of the required fields are populated and has one RAIL segment
    Given Trip approval requests request parameters    air_segments=0    car_segments=0    hotel_segments=0    rail_segments=1    trip_route=ONE_WAY    request_date_time=utc
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created

05_Verify that user can send his trip approval request when all of the required fields are populated and has two AIR and RAIL segments
    Given Trip approval requests request parameters    air_segments=2    car_segments=0    hotel_segments=0    rail_segments=2    trip_route=ROUND_TRIP    request_date_time=local
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created

06_Verify that user can send his trip approval request when all of the required fields are populated and has two CAR & HOTEL segments
    Given Trip approval requests request parameters    air_segments=0    car_segments=2    hotel_segments=2    rail_segments=0    trip_route=ROUND_TRIP    request_date_time=utc
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created

07_Verify that user can send his trip approval request when all of the required fields are populated and has multiple ALL segments
    Given Trip approval requests request parameters    air_segments=4    car_segments=4    hotel_segments=4    rail_segments=4    trip_route=ROUND_TRIP    request_date_time=local
    When User sends request to trip approval requests
    Then Response Status Code Is 200
    And Trip approval request is created
