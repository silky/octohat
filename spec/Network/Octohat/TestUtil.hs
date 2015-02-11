{-# LANGUAGE OverloadedStrings #-}

module Network.Octohat.TestUtil (removeAllTeams) where


import Network.Octohat.Members
import Network.Octohat.Types
import Network.Octohat.TestData

import Control.Monad (void)
import Test.Hspec



deleteAllTeams :: GitHub [DidDelete]
deleteAllTeams = do
  allTeams <- teamsForOrganization testOrganization
  let teamsToDelete = map teamId $ filter (\t -> teamName t /= "Owners") allTeams
  mapM deleteTeamFromOrganization teamsToDelete

removeAllTeams :: IO () -> IO ()
removeAllTeams _ = void $ runGitHub deleteAllTeams
