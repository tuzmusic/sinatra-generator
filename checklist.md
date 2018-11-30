You should be able to write a model file (ruby class), which defines its relationships using ActiveRecord macros (has_many, belongs_to, etc)...
...using a rake task

The DB generator should find all the models defined (app/models/*.rb), and for each model, create and execute a migration.

You should be able to make changes in the model
...ideally the program would know if changes are simply additions, or more complex updates that require a full regeneration.
...until that, all updates/changes will completely regenerate.

hold off on the CLI for now
Work on a class generator that will take input from wherever. From a CLI, from reading pre-written model files, from wherever.
The specs can assign the values that the migration-, controller-, and views-generators use.

FINDING HAS_MANY RELATIONSHIPS
  An artist has_many :songs.
  Therefore, songs table has artist_id
  Artist /table/ knows nothing about songs

  However, since Song already knows it belongs_to :artist,Song already has an artist_id column!

MANY_TO_MANY RELATIONSHIPS
  A song has_many :genres and a genre has_many :songs
  Many-to-many is represented as 
    Song:       has_many :song_genres
                has_many :genres, through: :song_genres
    Genre:      has_many :song_genres
                has_many :songs, through: :song_genres
    SongGenre:  belongs_to :song
                belongs_to :genre

  If all I'm doing is building the migration generator
    which takes a fully defined class 
    then the class will /already/ have all of these properties populated
    and it should all be factored in to the existing code
  The difference would come in
    when /generating/ that class
    whether reading from a model file
      which may already have all those definitions
      or, alternatively, might be missing a few
      or possibly might be missing a join table class
        except that would require seeing that Song has_many :genres
        and that Genre /also/ has_many :songs
        recognizing that this is a many-to-many relationship 
        and then /rewriting/ those relationships to reflect the join table relationship
  In any case, once we're using the table generator, 
    whatever happened before it has delivered /fully/ defined classes with all relationships, 
    including join table relationships
    and including the join table class itself.
    It would be nice to be able to have it take care of the join table class for us
    But as mentioned above that would require rewriting the class itself
    Which is NOT the job for the table generator.

  HOWEVER!!!
    In terms of making the migration,
    has_many and has_many_through relationships are NOT REPRESENTED IN ANY TABLE.
    Only belongs_to relationships are represented in a table!!!
    A one-to-many is represented by a parent_id column in the child
    And a many-to-many is represented by columns in the join table!
    That's it!!!


CLI
  @class_name
  @relationships [{relationship:, related_class:}]
  #run
  #get_class_name
  #get_relationships(class_name)
Generator
  #initialize(class_name)
  #create_relationship(relationship:, related_class:)
  @class: GeneratorClass
GeneratorClass
  #initialize(name)
  @relationships: [String] (lines of code)
  @name: String (and convenience methods)
  @properties: [{ name:String, type:String}]
  @has_many: [String] (names of classes)
  @belongs_to: [String] (names of classes)
  @has_many_through [{ many:String, through:String }]

ModelFileReader
  `#filepath` (for model source file)


MODELS AND TABLES
_ Interface for defining relationships
_ Implementation of relationships in models
_ Implementation of relationships in migrations (initial or changes?)
_ Execute db:migrate from code?  (Execute the SQL written in the Migration methods)

CONTROLLERS
_ Generate index action
_ Generate show action
_ Generate create action
_ Generate edit action

VIEWS
_ Generate index page
_ Generate show page
_ Generate create page
_ Generate edit page

