# README

The purpose of this API is to act as a home automation system in regards to temperature control. Setup is required, including custom programming on temperature sensors and on room to room heating systems.

Note, this is not an API for use by regular uses, it is built for automated systems.

Instructions on setting up

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version
  2.6.5
* System dependencies
  Postgres
  Rails
* Setup

A bash file with setup procedures is included
Contents are as follows:
```bash
bundle install
rake db:create
rake db:schema:load
rake db:seed
rails s

```
* How to run the test suite
```bash
rspec
```

## Endpoints
### GET /homes/
Returns a list of homes
### POST /homes/
params:
  - name (string)
  - address (string)

### GET /homes/current_temps
Returns a list of the temperatures of every room.

### GET /homes/[:home_id]
Returns stats on a single home

### PATCH /homes/[:home_id]
Update data on a single home
params:
  - name (string)
  - address (string)

### DELETE /homes/[:home_id]
Delete a home, and its child objects

### GET /homes/[:home_id]/rooms
Returns a list of rooms

### POST /homes/[:home_id]/rooms
params:
  - name (string)
  - temp_setting (integer)

### GET /homes/[:home_id]/rooms/[:room_id]
Returns stats on a single room

### PATCH /homes/[:home_id]/rooms/[:room_id]
Updates data on a single room
params:
  - name (string)
  - temp_setting (integer)

### PATCH /homes/[:home_id]/rooms/[:room_id]
Deletes a room

### GET /homes/[:home_id]/rooms/[:room_id]/ac_on
returns a boolean regarding whether the AC should be on or not and current temperature
Used for automated logic, this endpoint would be called by a smart air conditioner

### GET /homes/[:home_id]/rooms/[:room_id]/heater_on
returns a boolean regarding whether the heater should be on or not based on temperature setting and current temperature
Used for automated logic, this endpoint would be called by a smart heater


### GET /homes/[:home_id]/rooms/[:room_id]/current_temp
Returns the latest temperature reading in the room as an integer
Mostly for user interfaces as automated systems will use heater_on and ac_on endpoints

### GET /homes/[:home_id]/rooms/[:room_id]/temperatures_today
Returns temperature readings taken today
Mostly for user interfaces, can be used to make a graph of temperatures over time, for example.

### POST /homes/[:home_id]/rooms/[:room_id]/temperatures
params:
  - temperature (integer)
