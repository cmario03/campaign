Feature: ESU
	Checks the various Email Sign Up blocks 

  @javascript
  Scenario: ESU Standard
    Given I am on "/esu"
    Then I should see "ESU Standard: initial message" in the "esu_standard" region
    And I should not see "success" in the "esu_standard" region 
    And I fill in "edit-email" with "test@example.org" in the "esu_standard" region
    And I press "Go" in the "esu_standard" region
    Then I should have received the following data in the "esu" queue:
      | campaign | transType | email | source |
      | RND17 | esu | test@example.org | Banner |
    And I wait for AJAX loading to finish
    Then I should see "ESU Standard: success! (first message)" in the "esu_standard" region
    # And I select "HE" from "school_phase"
    # And I press "Go" in the "esu_standard" region
    # And I wait for AJAX loading to finish
    # Then I should see "ESU Standard: success! (second message)" in the "esu_standard" region

  @javascript
  Scenario: ESU Workflow
    Given I am on "/esu"
    Then I should see "ESU Workplace: initial message" in the "esu_workflow" region
    And I fill in "edit-email--2" with "test-workflow@example.org" in the "esu_workflow" region
    And I press "Go" in the "esu_workflow" region
    And I wait for AJAX loading to finish
    Then I should see "ESU Workplace: success message" in the "esu_workflow" region
    And I should have received the following data in the "esu_workplace" queue:
      | campaign | transType | transSource | email |
      | RND17 | esu | RND17_Unknown_ESU_Unknown | test-workflow@example.org |