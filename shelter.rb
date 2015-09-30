#!/usr/bin/env ruby

require 'pp'
require 'json'
require_relative 'animal'
require_relative 'dog'

pets = []

fido = Dog.new

fido.color = 'black'
fido.has_fur = true
fido.bark = 'loud'
fido.name = 'fido'
pets << fido

puts 'Pets rendered as JSON:'
puts pets.to_json
puts
puts '=== Recovering lost pets from the evil JSON Deville ==='
lost_pets = JSON.parse(pets.to_json, :create_additions => true)

puts '=== Here are your lost pets ==='
pp lost_pets