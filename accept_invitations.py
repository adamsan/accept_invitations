#!/usr/bin/env python3
import argparse
from github import Github
from github.Invitation import Invitation
from github.AuthenticatedUser import AuthenticatedUser

def __main__(token):
    gh = Github(token)
    gh_user = gh.get_user()
    pending_invitations = [inv for inv in gh_user.get_invitations()]
    print(f"Found {len(pending_invitations)} invitations.")
    for index, invitation in enumerate(pending_invitations):
        accept_invitation(gh_user, invitation)
        print("\n-----------------\n")
    print("Done.")
    # IPython.embed()

def accept_invitation(gh_user: AuthenticatedUser, invitation: Invitation):
    print(f"Trying to accept invitation from {invitation.inviter} for {invitation.html_url}")
    gh_user.accept_invitation(invitation.id)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Connects to github, and tries to accept all pending invitation. If an invitation is expired, removes it.")
    parser.add_argument("--token", required=True, help="Go to https://github.com/settings/tokens page, generate token with 'Access repository invitations' right enabled")
    args = parser.parse_args()
    __main__(args.token)