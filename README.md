# lita-yurudev

Yurufuwa Devroom Toolkit

## Installation

Add lita-yurudev to your Lita instance's Gemfile:

``` ruby
gem "lita-yurudev"
```


## Configuration

```
config.handlers.kina_endpoint = ENV['KINA_ENDPOINT']
config.handlers.kina_uuid     = ENV['KINA_UUID']
```

## Usage

```
route /^devroom users/, :devroom_users, command: false, help: { 'devroom users' => 'list users who is in the yurudev room' }
```

## License

[MIT](http://opensource.org/licenses/MIT)
