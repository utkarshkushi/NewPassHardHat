const { expect } = require('chai');


describe('Creatorism Pass Contract', function(){
    let NakTokens;
    let NewPass;
    let owner1;
    let owner2;
    let addr1;
    let addr2;

    beforeEach(async function(){
        [ owner1, owner2, addr1, addr2 ] = await ethers.getSigners();
        NakTokens = await ethers.getContractFactory("NakTokens");
        NakTokensDeploy = await NakTokens.deploy();
        NewPass = await ethers.getContractFactory("NewPass");
        NewPassDeploy = await NewPass.deploy(owner1.address);
    })

    describe('NakTokens contracts', async function(){
        it('checking if NFTs are issued by the contract', async function(){
            await NakTokensDeploy.connect(addr1).newToken();
            await NewPassDeploy.connect(addr1).newToken();
            expect(await NewPassDeploy.passIssued(addr1.address)).to.equal(true);
            
        })
    })
})
