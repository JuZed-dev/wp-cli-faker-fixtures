Feature: Nav menus fixtures

  Scenario: Generate nav menus
    Given a WP install
    And a fixtures.yml file:
    """
    JuZedDev\Fixtures\Entity\NavMenu:
      header:
        name: header
        locations:
          - header
          - footer
    """

    When I run `wp fixtures load`
    Then STDOUT should contain:
      """
      1 navmenu have been successfully created
      """

    When I run `wp menu list --format=count`
    Then STDOUT should be:
      """
      1
      """

  Scenario: Delete nav menus
    Given a WP install
    And a fixtures.yml file:
    """
    JuZedDev\Fixtures\Entity\NavMenu:
      header:
        name: header
        locations:
          - header
          - footer
    """

    When I run `wp fixtures load`
    When I run `wp fixtures delete navMenu --yes`
    Then STDOUT should contain:
      """
      1 navmenu have been successfully deleted
      """
