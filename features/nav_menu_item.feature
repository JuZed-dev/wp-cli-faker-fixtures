Feature: Nav menu item fixtures

  Scenario: Generate nav menu items
    Given a WP install
    And a fixtures.yml file:
    """
    JuZedDev\Fixtures\Entity\Post:
      post{1..4}:
        post_title: <sentence()>
      page:
        post_title: <sentence()>
    JuZedDev\Fixtures\Entity\Term:
      category{1..5}:
        name (unique): <words(3, true)>
    JuZedDev\Fixtures\Entity\NavMenu:
      header:
        name: header
        locations:
          - header
    JuZedDev\Fixtures\Entity\NavMenuItem:
      custom_menu:
        menu_item_url: <url()>
        menu_item_title: <words(4, true)>
        menu_id: '@header->term_id'
      categories{1..2}:
        menu_item_object: '@category*'
        menu_id: '@header->term_id'
      posts{1..2}:
        menu_item_object: '@post*'
        menu_id: '@header->term_id'
      page:
        menu_item_object: '@page*'
        menu_id: '@header->term_id'
    """

    When I run `wp fixtures load`
    Then STDOUT should contain:
      """
      6 navmenuitems have been successfully created
      """

    When I run `wp menu item list header --format=count`
    Then STDOUT should be:
      """
      6
      """

    When I run `wp menu item list header --fields=type`
    Then STDOUT should contain:
      """
      taxonomy
      """

    When I run `wp menu item list header --fields=type`
    Then STDOUT should contain:
      """
      custom
      """

    When I run `wp menu item list header --fields=type`
    Then STDOUT should contain:
      """
      post_type
      """

  Scenario: Delete nav menu items
    Given a WP install
    And a fixtures.yml file:
    """
    JuZedDev\Fixtures\Entity\Post:
      post{1..4}:
        post_title: <sentence()>
      page:
        post_title: <sentence()>
    JuZedDev\Fixtures\Entity\Term:
      category{1..5}:
        name (unique): <words(3, true)>
    JuZedDev\Fixtures\Entity\NavMenu:
      header:
        name: header
        locations:
          - header
    JuZedDev\Fixtures\Entity\NavMenuItem:
      custom_menu:
        menu_item_url: <url()>
        menu_item_title: <words(4, true)>
        menu_id: '@header->term_id'
      categories{1..2}:
        menu_item_object: '@category*'
        menu_id: '@header->term_id'
      posts{1..2}:
        menu_item_object: '@post*'
        menu_id: '@header->term_id'
      page:
        menu_item_object: '@page*'
        menu_id: '@header->term_id'
    """

    When I run `wp fixtures load`
    When I run `wp fixtures delete navMenuItem --yes`
    Then STDOUT should contain:
      """
      6 navmenuitems have been successfully deleted
      """
