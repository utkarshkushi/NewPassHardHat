const { expect } = require('chai');


describe('Creatorism Pass Contract', function(){
    
    let NewPass;
    let owner;
    let addr1;
    let addr2;

    beforeEach(async function(){
        [ owner, addr1, addr2 ] = await ethers.getSigners();
        NewPass = await ethers.getContractFactory("NewPass");
        NewPassDeploy = await NewPass.deploy();
    })

    describe('NakTokens contracts', async function(){
        it('checking if a address has naka nfts', async function(){
            expect(await NewPassDeploy.holdsNakaNFTs(addr1.address)).to.equal(false);
        });

        it('airDropping Function', async function(){
            expect(await NewPassDeploy.airDrop(addr2.address)).to.equal(true);
        })
    })

})
