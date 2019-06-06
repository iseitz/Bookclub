

    AGE_GROUPS =
      [
        '0-1',
        '1-2',
        '2-3',
        '3-4',
        '4-5',
        '5-6',
        '6-7',
        '7-8',
        '8-9',
        '9-10',
        '10-11',
        'Teens'
      ]



      AGE_GROUPS.each do |group|
        AgeGroup.find_or_create_by!(group: group)
      end
