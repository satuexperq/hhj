Feature: Applying for a position

  Background:
    Given there is open call for applications called 'Kirjakerhon lukurinki'

  Scenario: Submitting an application
    Given I am logged in as a student
    And I am at front page of 'Spartan Teknillinen Yliopisto'
    And I navigate to home page of call 'Kirjakerhon lukurinki'
    When I press 'Lähetä hakemus'
    Then show me the page
    Then I should see my own name, phone number and email-address in the application form
    Then I fill in form 'Lähetä hakemus':
      | label                      | value                                     |
      | Haen                       | Varajäseneksi                             |
      | Kenen varajäseneksi haluat | Tenho Taipale                             |
      | Perustelut                 | 3 vuoden kokemus Hallopedina toimimisesta |

    And I press 'Lähetä'
    Then I should see my own name, phone number and email-address in the confirmation dialog
    Then I should see dialog 'Hakemus lähetetty' with text '3 vuoden kokemus Hallopedina toimimisesta':
      | label                      | value         |
      | Haen                       | Varajäseneksi |
      | Kenen varajäseneksi haluat | Tenho Taipale |

    And I press 'Ok'

    Then I should see call for application 'Kirjakerhon lukurinki'

  Scenario: Submitting an application when my phone number is not stored in the system
    Given I am logged in as a student
    And I am at front page of 'Spartan Teknillinen Yliopisto'
    And I navigate to home page of call 'Kirjakerhon lukurinki'
    When I press 'Lähetä hakemus'
    Then show me the page
    Then I fill in form 'Käyttäjän tiedot':
      | label            | value    |
      | "Puhelinnumero:" | 12345678 |
    And I press 'Ok'
    Then I should see call for application 'Kirjakerhon lukurinki'


