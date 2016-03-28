# Carpet
Welcome to Carpet. This gem allows you to render fields of a model with [Redcarpet](https://github.com/vmg/redcarpet). Instead of having to write a custom method in your model or controller to render a model's field with Redcarpet, Carpet allows you to do it in one line.

## Installation
Carpet is a Ruby on Rails plugin. To start using Carpet, add the following line to your application's Gemfile:
```ruby
  gem 'carpet', git: "git://github.com/railsrocks/carpet.git"
```
Now, execute:
```bash
  $ bundle
```
Congratulations! You're all ready to start using Carpet.

## Usage
Carpet is designed to be simple to use, but has many options available. The simplest way of using Carpet will be to add the following line to your model:
```ruby
  redcarpetable :field_name
```
This will render whatever field you passed in with the standard Redcarpet HTML renderer. If you want to specify multiple fields to render, separate them with commas, like this:
```ruby
  redcarpetable :field_name, :another_field_name, :yet_another_field_name
```
Redcarpet also allows you to pass a set of options to the renderer. To specify these options, add a ```render_opts``` hash to your model, like so:
```ruby
  redcarpetable :field_name, render_opts: {some_option: some_value}
```
If you specified multiple fields in the same line, the render options will apply to all of them. If you need different render options for each field, you will have to make a new line for that field.
To access the rendered content for a field, use the following statement:
```ruby
  yourmodel.rendered_field_name
```
If you need to customize the name of that method, specify an array of names, like ths:
```ruby
  redcarpetable :field_name, as: [:some_name, :some_other_name]
```
So, then you would say:
```ruby
  yourmodel.some_other_name
```
or:
```ruby
  yourmodel.some_name
```
If you have specified multiple fields in one line, it is not possible to change the name of the method that provides the rendered field. However, the prefix for that method can be set like this:
```ruby
  redcarpetable :field_name, :another_field_name, prefixes: ["cool", "rendered"]
```
So, then the rendered content of those two fields is available through:
```ruby
  yourmodel.cool_field_name
  yourmodel.cool_another_field_name
```
and:
```ruby
  yourmodel.rendered_field_name
  yourmodel.rendered_another_field_name
```
To use a custom Redcarpet renderer instead of the default one in your model, it must be generated with the following command:
```bash
  $ rails generate carpet your_renderer_name
```
This will create a skeletal renderer in app/redcarpet_renderers/your_renderer_name.rb
To use this renderer instead of the default one in a model, add the following line:
```ruby
  redcarpetable :field_name, renderer: :your_renderer_name
```
If you need help, feel free to post a question on the repository.

## Contributing
Feel free to make a pull request!

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
