*** Settings ***
Suite Setup       Open MongoDB
Suite Teardown    Close MongoDB
Force Tags        internal-error-handling    error-handling
Resource          resources/trip-approval-requests.robot

*** Test Cases ***
01.01_Verify that error is returned when invalid authorization token is used
    Given Trip approval requests request parameters    authorization_token=invalid
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 401
    And Authorization Error Message Is Returned    error=invalid_token    error_description=The access token is invalid or has expired
    And Trip approval request is not saved

01.02_Verify that error is returned when blank authorization token is used
    Given Trip approval requests request parameters    authorization_token=${empty}
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 401
    And Authorization Error Message Is Returned    error=invalid_request    error_description=The access token is missing
    And Trip approval request is not saved

01.03_Verify that error is returned when no authorization token is used
    Given Trip approval requests request parameters    authorization_token=none
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 401
    And Authorization Error Message Is Returned    error=invalid_request    error_description=The access token is missing
    And Trip approval request is not saved

02.01_Verify that error is returned when no segment is used
    Given Trip approval requests request parameters    air_segments=0    car_segments=0    hotel_segments=0    rail_segments=0
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=At least one segment is required
    And Trip approval request is not saved

03.01_Verify that error is returned when blank traveler guid is used
    Given Trip approval requests request parameters    traveler_guid=${empty}
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=travelerGuid is required
    And Trip approval request is not saved

03.02_Verify that error is returned when null traveler guid is used
    Given Trip approval requests request parameters    traveler_guid=null
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=travelerGuid is required
    And Trip approval request is not saved

03.03_Verify that error is returned when no traveler guid is used
    Given Trip approval requests request parameters    traveler_guid=none
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=travelerGuid is required
    And Trip approval request is not saved

04.01_Verify that error is returned when blank trip purpose is used
    Given Trip approval requests request parameters    trip_purpose=${empty}
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=tripPurpose is required
    And Trip approval request is not saved

04.02_Verify that error is returned when null trip purpose is used
    Given Trip approval requests request parameters    trip_purpose=null
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=tripPurpose is required
    And Trip approval request is not saved

04.03_Verify that error is returned when no trip purpose is used
    Given Trip approval requests request parameters    trip_purpose=none
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=tripPurpose is required
    And Trip approval request is not saved

05.01_Verify that error is returned when blank request date time is used
    Given Trip approval requests request parameters    request_date_time=${empty}
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=requestDateTime is required
    And Trip approval request is not saved

05.02_Verify that error is returned when null request date time is used
    Given Trip approval requests request parameters    request_date_time=null
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=requestDateTime is required
    And Trip approval request is not saved

05.03_Verify that error is returned when no request date time is used
    Given Trip approval requests request parameters    request_date_time=none
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Message Is Returned    code=400 BAD_REQUEST    message=requestDateTime is required
    And Trip approval request is not saved

06.01_Verify that error is returned when all of the required fields are blank and no segments
    Given Trip approval requests request parameters    air_segments=0    car_segments=0    hotel_segments=0    rail_segments=0    traveler_guid=${empty}    trip_purpose=${empty}
    ...    request_date_time=${empty}
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Messages Are Displayed
    And Trip approval request is not saved

06.02_Verify that error is returned when all of the required fields are null and no segments
    Given Trip approval requests request parameters    air_segments=0    car_segments=0    hotel_segments=0    rail_segments=0    traveler_guid=null    trip_purpose=null
    ...    request_date_time=null
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Messages Are Displayed
    And Trip approval request is not saved

06.03_Verify that error is returned when all of the required fields are none and no segments
    Given Trip approval requests request parameters    air_segments=0    car_segments=0    hotel_segments=0    rail_segments=0    traveler_guid=none    trip_purpose=none
    ...    request_date_time=none
    And Get current record count
    When User sends request to trip approval requests
    Then Response Status Code Is 400
    And Error Messages Are Displayed
    And Trip approval request is not saved
