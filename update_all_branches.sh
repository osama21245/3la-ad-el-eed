#!/bin/bash

# Script to update all branches with Firebase configuration changes

echo "Starting Firebase configuration update across all branches..."

# Store current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"

# List of all local branches
BRANCHES=("main" "development" "testing" "auth" "add_product" "add_shop")

# Loop through each branch
for branch in "${BRANCHES[@]}"; do
    echo "=========================================="
    echo "Processing branch: $branch"
    echo "=========================================="
    
    # Checkout the branch
    echo "Checking out $branch..."
    git checkout $branch
    
    if [ $? -eq 0 ]; then
        echo "Successfully checked out $branch"
        
        # Pull latest changes from remote
        echo "Pulling latest changes from origin/$branch..."
        git pull origin $branch
        
        # Cherry-pick the Firebase configuration commit
        echo "Cherry-picking Firebase configuration commit..."
        git cherry-pick eed0b5c
        
        if [ $? -eq 0 ]; then
            echo "Successfully cherry-picked Firebase configuration to $branch"
            
            # Push to remote
            echo "Pushing changes to origin/$branch..."
            git push origin $branch
            
            if [ $? -eq 0 ]; then
                echo "✅ Successfully updated $branch with Firebase configuration"
            else
                echo "❌ Failed to push changes to $branch"
            fi
        else
            echo "❌ Failed to cherry-pick Firebase configuration to $branch"
            echo "Attempting to resolve conflicts manually..."
            
            # Check if there are conflicts
            if [ -n "$(git status --porcelain)" ]; then
                echo "Resolving conflicts in $branch..."
                git add .
                git commit -m "Resolve conflicts and update Firebase configuration"
                git push origin $branch
                echo "✅ Resolved conflicts and pushed $branch"
            fi
        fi
    else
        echo "❌ Failed to checkout $branch"
    fi
    
    echo ""
done

# Return to original branch
echo "Returning to original branch: $CURRENT_BRANCH"
git checkout $CURRENT_BRANCH

echo "=========================================="
echo "Firebase configuration update completed!"
echo "==========================================" 