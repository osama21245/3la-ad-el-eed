#!/bin/bash

# Script to update all branches with AddProductCubit enum-based state changes

echo "Starting AddProductCubit update across all branches..."

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
        
        # Cherry-pick the AddProductCubit commit
        echo "Cherry-picking AddProductCubit commit..."
        git cherry-pick 6887b4a
        
        if [ $? -eq 0 ]; then
            echo "Successfully cherry-picked AddProductCubit to $branch"
            
            # Push to remote
            echo "Pushing changes to origin/$branch..."
            git push origin $branch
            
            if [ $? -eq 0 ]; then
                echo "✅ Successfully updated $branch with AddProductCubit changes"
            else
                echo "❌ Failed to push changes to $branch"
            fi
        else
            echo "❌ Failed to cherry-pick AddProductCubit to $branch"
            echo "Attempting to resolve conflicts manually..."
            
            # Check if there are conflicts
            if [ -n "$(git status --porcelain)" ]; then
                echo "Resolving conflicts in $branch..."
                git add .
                git commit -m "Resolve conflicts and update AddProductCubit"
                git push origin $branch
                echo "✅ Resolved conflicts and pushed $branch"
            else
                echo "No conflicts to resolve, skipping cherry-pick..."
                git cherry-pick --skip
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
echo "AddProductCubit update completed!"
echo "==========================================" 