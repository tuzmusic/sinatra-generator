You should be able to write a model file (ruby class), which defines its relationships using ActiveRecord macros (has_many, belongs_to, etc)...
...using a rake task

The DB generator should find all the models defined (app/models/*.rb), and for each model, create and execute a migration.

You should be able to make changes in the model
...ideally the program would know if changes are simply additions, or more complex updates that require a full regeneration.
...until that, all updates/changes will completely regenerate.

***FOR THURSDAY!!!***

hold off on the CLI for now
Work on a class generator that will take input from wherever. From a CLI, from reading pre-written model files, from wherever.
The specs can assign the values that the migration-, controller-, and views-generators use.


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

