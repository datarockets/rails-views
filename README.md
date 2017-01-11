# Rails::Views

*View Components for Ruby and Rails.*

The gem provides view models for Ruby web applications. View models are plain objects that represent a part of the web page. View models can also render views, and be nested.

This gem bases on [cells](https://github.com/trailblazer/cells).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-views'
```

And then execute:

    $ bundle

## Usage

This gem bases on [cells](https://github.com/trailblazer/cells), but includes only `Concept` logic.

A view is a light-weight class with `show.slim` temlate with base view logic.

```ruby
class Comment::Cell < Rails::View

  private

  property :body, :author

  def author_link
    link_to "#{author.email}", author
  end
end
```

## Rendering

Gem provides logic for rendering cells instead of ActionView templates.

```ruby
def CommentsController < ApplicationController
  def index
    render cell: true # will render Comments::Cell
  end

  def show
    @comment = Comment.find(params[:id])
    render cell: :show, model: @comment # will render Comments::Show::Cell with @comment as model
  end

  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    render cell: 'user/comment', model: @comment, options: {user: @user} # will render User::Comment::Cell with @comment as model and user options
  end
end
```

## Helpers

Also gem provides new helpers for rails.

### Flash

Provide method for working with flash.

```ruby
= flash[:notice]
```

### Render partials array

Method `render_each_and_join` can render array of templates and join it in one string.

```ruby
class User::Info::Cell < Rails::View
  private

  def parts_of_info
    %w(contact_information about jobs transactions_list)
  end

  def info_body
    render_each_and_join(parts_of_info)
  end
end

class User::ShortInfo::Cell < User::Info::Cell
  private

  def parts_of_info
    %w(contact_information about)
  end
end
```

### Options

Provide `options` reader. You can have automatic readers to the options's fields by using `::option`

```ruby
class User::Comment::Cell < Rails::View
  private
    options :user # delegate to options[:user]

    delegate :email, to: :user, prefix: true
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run the test suite and check the output (`rake`)
4. Add tests for your feature or fix (please)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

Bug reports and pull requests are welcome on GitHub at https://github.com/datarockets/rails-views


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

