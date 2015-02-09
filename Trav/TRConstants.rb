module TRConstants
  BASIC_URL = 'http://tx2.travian.com/'
  MY_X = -107
  MY_Y = -35

  EMPTY_PRODUCTION_BOOST = {wood: 0.0, clay: 0.0, iron: 0.0, wheat: 0.0}

  BASIC_URL_ATTACK = 'http://ts8.travian.com/'

  BUILD_NEW_BUTTON_CLASS = 'green new'
  BUILD_BUTTON_CLASS = 'green build'

  HERO_ADVENTURE_BUTTON_CLASS = 'layoutButton adventureWhite green '
  GO_FOR_ADVENTURE_BUTTON_ID = 'start'
  GO_TO_ADVENTURE_CLASS = 'gotoAdventure arrow'
  ADVENTURE_MOVING_TIME_CLASS = 'moveTime'

  SAVE_HERO_ATTRIBUTES_BUTTON_ID = 'saveHeroAttributes'

  HERO_IMAGE_BUTTON_ID = 'heroImageButton'
  FIELDS_HREF = 'dorf1.php'
  VILLAGE_HREF = 'dorf2.php'
  REPORTS_HREF = 'berichte.php'

  BUILDINGS = %w(build.php?id=19 build.php?id=20 build.php?id=21 build.php?id=22 build.php?id=23 build.php?id=24 build.php?id=25 build.php?id=26 build.php?id=27 build.php?id=28 build.php?id=29 build.php?id=30 build.php?id=31 build.php?id=32 build.php?id=33 build.php?id=34 build.php?id=35 build.php?id=36 build.php?id=37 build.php?id=38 build.php?id=39 build.php?id=40)

  FIELDS = {
      wood: [
          ['build.php?id=1'],
          ['build.php?id=3'],
          ['build.php?id=14'],
          ['build.php?id=17']
      ],
      wheat: [
          ['build.php?id=2'],
          ['build.php?id=8'],
          ['build.php?id=9'],
          ['build.php?id=12'],
          ['build.php?id=13'],
          ['build.php?id=15']
      ],
      iron: [
          ['build.php?id=4'],
          ['build.php?id=7'],
          ['build.php?id=10'],
          ['build.php?id=11']
      ],
      clay: [
          ['build.php?id=5'],
          ['build.php?id=6'],
          ['build.php?id=16'],
          ['build.php?id=18']
      ]
  }

  R_INFO_WOOD = 'l1'
  R_INFO_CLAY = 'l2'
  R_INFO_IRON = 'l3'
  R_INFO_WHEAT = 'l4'

  HERO_ALL = 'resourceHero0'
  HERO_WOOD = 'resourceHero1'
  HERO_CLAY = 'resourceHero2'
  HERO_IRON = 'resourceHero3'
  HERO_WHEAT = 'resourceHero4'

  COMPLETE_CONSTRUCTION_IMMEDIATELY_VALUE = 'complete construction immediately'
  REDEEM_VALUE = 'Redeem'

  QUEST_MASTER_ID = 'questmasterButton'
  COLLECT_REWARD_BUTTON_CLASS = 'green questButtonNext'
  COLLECT_REWARD_BUTTON_VALUE = 'Collect reward.'
  BIG_SPEECH_BUBBLE = 'bigSpeechBubble'

  MESSAGE_ADVENTURE_CLASS = 'adventure'

  TUTORIAL_ALARM_CLASS = 'highlighted on'


end