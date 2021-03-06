#!perl
package MUD;
use Moose;
use namespace::autoclean;

has server => (
    is       => 'rw',
    isa      => 'MUD::Server',
    required => 1,
    handles  => [ qw(run) ],
);

has universe => (
    is  => 'rw',
    isa => 'MUD::Universe',
);

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

MUD - "multi-user dungeon" framework

=head1 SYNOPSIS

  package MyInputState;
  use base 'MUD::Input::State';

  sub run { "You are in a MUD!" }

  package main;
  use MUD::Server;

  MUD::Server->new(starting_state => MyInputState->new)->run;

Basically, you have your L<MUD::Player>, L<MUD::Input::State>,
L<MUD::Universe>, and, most importantly, your L<MUD::Server>.

=head1 THE SERVER

The server that runs the MUD (L<MUD::Server>) uses POE for its socket system and
Moose for its object system. 

=head1 THE UNIVERSE

Your MUD will contain a universe (L<MUD::Universe>). This is mainly for
things that are pertinent to the game's environment.

=head1 INPUT STATES

Your MUD will require input from your users for things other than game
commands such as entering a name and passowrd. See L<MUD::Input::States>
for more details.

=head1 AUTHOR

Jason May C<< <jason.a.may@gmail.com> >>

=cut


